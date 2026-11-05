(() => {
  const finePointer = matchMedia('(hover: hover) and (pointer: fine)');
  const reducedMotion = matchMedia('(prefers-reduced-motion: reduce)');
  const canvas = document.createElement('canvas');
  canvas.setAttribute('aria-hidden', 'true');
  Object.assign(canvas.style, {
    position: 'fixed', inset: '0', width: '100%', height: '100%',
    pointerEvents: 'none', zIndex: '10000',
  });
  const context = canvas.getContext('2d');
  if (!context) return;
  let points = [], frame = 0, enabled = false;
  function resize() {
    const ratio = Math.min(devicePixelRatio || 1, 2);
    canvas.width = Math.round(innerWidth * ratio);
    canvas.height = Math.round(innerHeight * ratio);
    context.setTransform(ratio, 0, 0, ratio, 0, 0);
  }
  function stop() {
    cancelAnimationFrame(frame);
    frame = 0;
    points = [];
    context.clearRect(0, 0, innerWidth, innerHeight);
  }
  function draw(now) {
    context.clearRect(0, 0, innerWidth, innerHeight);
    points = points.filter(point => now - point.time < 360);
    points.forEach((point, index) => {
      const life = 1 - (now - point.time) / 360;
      context.beginPath();
      context.fillStyle = `rgba(${index % 2 ? '124,92,252' : '0,217,255'},${life * 0.5})`;
      context.arc(point.x, point.y, 1 + life * 4, 0, Math.PI * 2);
      context.fill();
    });
    frame = points.length ? requestAnimationFrame(draw) : 0;
  }
  function update() {
    enabled = finePointer.matches && !reducedMotion.matches;
    if (enabled) {
      if (!canvas.isConnected) document.body.append(canvas);
      resize();
    } else {
      stop();
      canvas.remove();
    }
  }
  window.addEventListener('pointermove', event => {
    if (!enabled || event.pointerType !== 'mouse') return;
    const now = performance.now();
    const last = points[points.length - 1];
    if (last && Math.hypot(last.x - event.clientX, last.y - event.clientY) < 3) return;
    points.push({ x: event.clientX, y: event.clientY, time: now });
    if (points.length > 36) points.shift();
    if (!frame) frame = requestAnimationFrame(draw);
  }, { passive: true });
  document.documentElement.addEventListener('pointerleave', stop);
  window.addEventListener('blur', stop);
  document.addEventListener('visibilitychange', () => { if (document.hidden) stop(); });
  window.addEventListener('resize', () => { if (enabled) { stop(); resize(); } });
  finePointer.addEventListener('change', update);
  reducedMotion.addEventListener('change', update);
  update();
})();

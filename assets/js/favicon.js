(() => {
  window.addEventListener("DOMContentLoaded", () => {
    const now = new Date();
    const date = now.getDate().toString().padStart(2, "0");
  
    const link = document.querySelector('link[rel="icon"]');
    const svg = `
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
        <rect x="0" y="0" width="32" height="32" rx="6" ry="6" fill="#C0C0C0" />
        <text x="16" y="16" dx="0.04em" dy="0.37em" text-anchor="middle" font-family="Arial, Helvetica, sans-serif" font-size="20" letter-spacing="1.5" font-weight="700" fill="black">${date}</text>
      </svg>
    `;

    link.href = `data:image/svg+xml;charset=utf-8,${encodeURIComponent(svg)}`;
  });
})();

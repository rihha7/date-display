// redundant: kept for reference, not used by the current project

(function () {
  const canvas = document.createElement("canvas"); // 1) Create Canvas
  canvas.width = 64;  // 2) Define canvas width + height
  canvas.height = 64;
  const ctx = canvas.getContext("2d");  // 3) Create context
  
  // 4) Background
  ctx.fillStyle = "#C0C0C0";
  ctx.beginPath(); // 5) Circular Background
  const centerX = canvas.width / 2;
  const centerY = canvas.height / 2;
  const radius = canvas.width / 2;
  ctx.arc(centerX, centerY, radius, 0, Math.PI * 2)
  ctx.fill();

  // 6) Dynamic Text
  const currentDate = new Date().getDate(); // e.g., 23
  ctx.font = "bold 36px sans-serif";
  ctx.fillStyle = "black";
  ctx.textAlign = "center";
  ctx.textBaseline = "middle";
  ctx.fillText(currentDate, centerX, centerY + 3);

  // 7) Update Favicon
  const favicon = document.getElementById("dynamic-favicon");
  favicon.href = canvas.toDataURL("icon/png");
})();

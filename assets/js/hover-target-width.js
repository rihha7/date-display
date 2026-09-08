(() => {
  window.addEventListener("DOMContentLoaded", () => {
    const h1Wrapper = document.querySelectorAll("#h1-wrapper");
    
    h1Wrapper.forEach(wrapper => {
      const dateSegment = wrapper.querySelector("h1").innerHTML;
      const hoverTarget = wrapper.querySelector("div#h1-hover-target");

      const existingWidths = [...hoverTarget.classList].filter(style => style.startsWith("w-"));
      existingWidths.forEach(w => hoverTarget.classList.remove(w));

      if (dateSegment.length === 2) {
        if (dateSegment === "11") {
          hoverTarget.classList.add("w-22");
        } else if (dateSegment.endsWith("1") || dateSegment.startsWith("1")) {
          hoverTarget.classList.add("w-26");
        } else {
          hoverTarget.classList.add("w-30");
        }
      }

      if (dateSegment.length === 4) {
        const oneCount = dateSegment.includes("1")?.length ?? 0;

        const widthHandlers = {
          0: () => { hoverTarget.classList.add("w-63") },
          1: () => { hoverTarget.classList.add("w-60") },
          2: () => { hoverTarget.classList.add("w-55") },
          3: () => { hoverTarget.classList.add("w-49.5") },
          4: () => { hoverTarget.classList.add("w-47") },
        };

        widthHandlers[oneCount]();
      };
    });

  });
})();

(() => {
  window.addEventListener("DOMContentLoaded", () => {
    const h1Wrapper = document.querySelectorAll("#h1-wrapper");

    // large
    const setDefaultWidths = () => {
      h1Wrapper.forEach(wrapper => {
        const dateSegment = wrapper.querySelector("h1").innerHTML;
        const hoverTarget = wrapper.querySelector("div#h1-hover-target");

        // 1. cleanup...
        const existingWidths = [...hoverTarget.classList].filter(style => style.startsWith("w-"));
        existingWidths.forEach(w => hoverTarget.classList.remove(w));
        hoverTarget.style.width = "";
        hoverTarget.style.height = "";

        // 2. set new default widths for large
        if (dateSegment.length === 2) {
          if (dateSegment === "11") {
            hoverTarget.classList.add("w-[5.5rem]");
          } else if (dateSegment.endsWith("1") || dateSegment.startsWith("1")) {
            hoverTarget.classList.add("w-[6.5rem]");
          } else {
            hoverTarget.classList.add("w-[7.5rem]");
          }
        }

        if (dateSegment.length === 4) {
          const oneCount = dateSegment.includes("1")?.length ?? 0;

          const widthHandlers = {
            0: () => { hoverTarget.classList.add("w-[15.75rem]") },
            1: () => { hoverTarget.classList.add("w-[15rem]") },
            2: () => { hoverTarget.classList.add("w-[13.75rem]") },
            3: () => { hoverTarget.classList.add("w-[12.375rem]") },
            4: () => { hoverTarget.classList.add("w-[11.75rem]") },
          };

          widthHandlers[oneCount]();
        };
      });
    };


    // medium
    const responsiveHoverSize = () => {
      h1Wrapper.forEach(wrapper => {
        const dateSegment = wrapper.querySelector("h1").innerHTML;
        const hoverTarget = wrapper.querySelector("div#h1-hover-target");

        let existingWidth = [...hoverTarget.classList].find(style => style.startsWith("w-"));
        let existingHeight = [...hoverTarget.classList].find(style => style.startsWith("h-"));
        existingWidth = Number(existingWidth.match(/[\d.]+/)?.[0] || 0);
        existingHeight = Number(existingHeight.match(/[\d.]+/)?.[0] || 0);

        hoverTarget.style.width = (dateSegment.length == 2)
          ? `${existingWidth - 1.5}rem`
          : `${existingWidth - 3.6}rem`;
      });
    }

    // concept:
    // 1. ALWAYS (first):      setDefaultWidths() // large
    // 2. if current = medium: setMedium()
    // 3. medium -> large:     setDefaultWidths()
    // 4. large -> medium:     setMedium()


    
    // -----------------------------------------------------------
    // 1) call function to normalize width
    const currentPageWidth = window.innerWidth;
    let size = (currentPageWidth <= 725) ? "medium" : "large";
    setDefaultWidths(); // default hover target widths for large
    if (size === "medium") responsiveHoverSize(size);

    
    // 2) on resize
    const [medium, large] = [
      window.matchMedia('(width <= 725px)'),
      window.matchMedia('(726px <= width)'),
    ];

    function handleBreakpoint() {
      if (medium.matches) {
        if (size === "large") {
          size = "medium";
          responsiveHoverSize();
          console.log("med -> large");
        }
      } else if (large.matches) {
        if (size === "medium") {
          size = "large";
          setDefaultWidths();
          console.log("large -> med");
        }
      }
    }

    // window resize fires repeatedly while the browser is being resized == too many
    // window.addEventListener('resize', handleBreakpoint);
    medium.addEventListener('change', handleBreakpoint);
    large.addEventListener('change', handleBreakpoint);
  });
})();

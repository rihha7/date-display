(() => {
  window.addEventListener("DOMContentLoaded", () => {
    const h1Wrapper = document.querySelectorAll("#h1-wrapper");

    const setDefaultWidths = () => {
      h1Wrapper.forEach(wrapper => {
        const dateSegment = wrapper.querySelector("h1").innerHTML;
        const hoverTarget = wrapper.querySelector("div#h1-hover-target");

        // 1. cleanup...
        const existingWidths = [...hoverTarget.classList].filter(style => style.startsWith("w-"));
        existingWidths.forEach(w => hoverTarget.classList.remove(w));
        hoverTarget.style.width = "";
        hoverTarget.style.height = "";


        // 2. set default=larger hover target widths (i.e., page width > 725px)
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
        }
      });
    };



    const setMediumWidths = () => {
      h1Wrapper.forEach(wrapper => {
        const dateSegment = wrapper.querySelector("h1").innerHTML;
        const hoverTarget = wrapper.querySelector("div#h1-hover-target");

        let existingWidth = [...hoverTarget.classList].find(style => style.startsWith("w-"));
        let existingHeight = [...hoverTarget.classList].find(style => style.startsWith("h-"));
        existingWidth = Number(existingWidth.match(/[\d.]+/)?.[0] || 0);
        existingHeight = Number(existingHeight.match(/[\d.]+/)?.[0] || 0);

        hoverTarget.style.width = (dateSegment.length == 2)
          ? `${existingWidth - 1.7}rem`
          : `${existingWidth - 3.8}rem`;

        hoverTarget.style.height = `${existingHeight - 1.25}rem`;
      });
    };


    // Concept:
    // 1. First, always:       setDefaultWidths() // large
    // 2. if current = medium: setMediumWidths()
    // 3. medium -> large:     setDefaultWidths()
    // 4. large -> medium:     setMediumWidths()


    // -----------------------------------------------------------


    const currentPageWidth = window.innerWidth;
    let size = (currentPageWidth < 725) ? "medium" : "large";
    setDefaultWidths(); // first, set hover target width to default=large
    if (size === "medium") setMediumWidths(size);


    // page resizing...
    const [medium, large] = [
      window.matchMedia('(width < 725px)'),
      window.matchMedia('(725px <= width)'),
    ];

    function handleBreakpoint() {
      if (medium.matches) {
        if (size === "large") {
          size = "medium";
          setMediumWidths();
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

    medium.addEventListener('change', handleBreakpoint);
    large.addEventListener('change', handleBreakpoint);
  });
})();

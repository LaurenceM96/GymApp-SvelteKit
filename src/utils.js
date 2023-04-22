export function clickOutside(node) {
	const handleClick = (event) => {
        if (node.previousElementSibling.contains(event.target)) {
            return;
        }
		if (!node.contains(event.target)) {
			node.dispatchEvent(new CustomEvent("outclick"));
		}
	};

	document.addEventListener("click", handleClick, true);

	return {
		destroy() {
			document.removeEventListener("click", handleClick, true);
		}
	};
}

  
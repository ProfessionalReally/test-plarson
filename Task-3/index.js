(function () {
    const readyFunctions = [];

    function onReady() {
        readyFunctions.forEach(fn => fn());
    }

    function $$(fn) {
        // If the page is fully loaded, we call it immediately
        if (document.readyState === 'complete') {
            fn();
        } else {
            // Otherwise save and execute later
            readyFunctions.push(fn);
        }
    }

    if (document.readyState === 'complete') {
        // Already loaded - call
        onReady();
    } else {
        // Waiting for full loading
        window.addEventListener('load', onReady);
    }

    // Export $$ for use
    window.$$ = $$;
})();

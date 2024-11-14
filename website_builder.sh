#!/bin/bash

# Welcome message
echo "Welcome to the Terminal Website Builder!"

# Get the website title from the user
read -p "Enter the website title: " title

# Create a directory with the title name
mkdir -p "$title"
cd "$title" || exit

# Function to create the HTML file
create_html() {
    cat <<EOF > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>$title</h1>
EOF

    # Get sections from the user
    while true; do
        read -p "Enter a section name (or press Enter to finish): " section
        if [ -z "$section" ]; then
            break
        fi
        echo "    <section>" >> index.html
        echo "        <h2>$section</h2>" >> index.html
        echo "        <p>This is the $section section.</p>" >> index.html
        echo "    </section>" >> index.html
    done

    cat <<EOF >> index.html
    <script src="script.js"></script>
</body>
</html>
EOF
}

# Function to create the CSS file
create_css() {
    cat <<EOF > style.css
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    color: #333;
    text-align: center;
}

h1 {
    color: #0066cc;
    margin-top: 20px;
}

section {
    margin: 20px;
    padding: 20px;
    border: 1px solid #ddd;
    background-color: #fff;
}
EOF
}

# Function to create the JavaScript file
create_js() {
    cat <<EOF > script.js
console.log('Welcome to the website!');
EOF
}

# Create the HTML, CSS, and JS files
create_html
create_css
create_js

# Completion message
echo "Website '$title' created successfully!"
echo "Check the '$title' folder for the files: index.html, style.css, and script.js."

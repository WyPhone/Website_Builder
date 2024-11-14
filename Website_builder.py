import os

def create_html(title, sections):
    html_content = f"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{title}</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>{title}</h1>
"""
    for section in sections:
        html_content += f"    <section>\n        <h2>{section}</h2>\n        <p>This is the {section} section.</p>\n    </section>\n"
    html_content += """
    <script src="script.js"></script>
</body>
</html>"""
    
    return html_content

def create_css():
    return """body {
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
"""

def create_js():
    return """console.log('Welcome to the website!');"""

def main():
    print("Welcome to the Terminal Website Builder!")
    title = input("Enter the website title: ")

    print("Let's add some sections to your website.")
    sections = []
    while True:
        section_name = input("Enter a section name (or press Enter to finish): ")
        if section_name == "":
            break
        sections.append(section_name)

    # Create directory for website files
    if not os.path.exists(title):
        os.makedirs(title)
    
    # Write HTML, CSS, and JS files
    with open(os.path.join(title, "index.html"), "w") as html_file:
        html_file.write(create_html(title, sections))
    with open(os.path.join(title, "style.css"), "w") as css_file:
        css_file.write(create_css())
    with open(os.path.join(title, "script.js"), "w") as js_file:
        js_file.write(create_js())
    
    print(f"Website '{title}' created successfully!")
    print("Open the folder and check out 'index.html' to view your website.")

if __name__ == "__main__":
    main()

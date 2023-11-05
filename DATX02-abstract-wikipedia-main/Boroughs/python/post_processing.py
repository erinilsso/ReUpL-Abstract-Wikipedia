import re
p = re.compile(r'(?<=[\.\?!]\s)(\w+)')

def capitalize(line):
    def cap(match):
        return(match.group().capitalize())

    return p.sub(cap, line)

def newLine(line):
    return line.replace("Newline_identifier_token. ", "\n<br>\n")

def fix_dotlist(text):
    # Removes "there is" before every dot list
    text = text.replace(". es gibt <ul>", "<ul>")
    text = text.replace(". there is <ul>", "<ul>")
    text = text.replace(". there are <ul>", "<ul>")
    text = text.replace(". det finns <ul>", "<ul>")

    # Removes "there is" before every h2
    text = text.replace("es gibt <h2>", "<h2>")
    text = text.replace("there is <h2>", "<h2>")
    text = text.replace("det finns <h2>", "<h2>")

    text = text.replace("</li>, <li>", "</li><li>")
    text = text.replace("</li> and <li>", "</li><li>")
    text = text.replace("</li> und <li>", "</li><li>")
    text = text.replace("</li> och <li>", "</li><li>")
    text = text.replace("</ul>.", "</ul>")

    return text


# "es gibt <ul>" "<ul>"
# <h2> Event </h2>. det finns <ul> <li> event1 </li> , <li> event2 </li>

def post_process(text):
    text = fix_dotlist(text)
    text = capitalize(text)
    text = newLine(text)
    return text


def main():
    res_file_path = "../data/res.txt"
    a_file = open(res_file_path)
    lines = a_file.readlines()

    for line in lines:
        processed_line = post_process(line)
        print(processed_line)

if __name__ == "__main__":
    main()
def saveFile(number: int, content: str):
    file = open(f'./output/{str(number)}.html', 'w', encoding='utf8')
    file.write(content)
    file.close()

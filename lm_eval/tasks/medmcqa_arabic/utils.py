# def doc_to_text(doc):
#     return f"السؤال: {doc['question']}\n(أ) {doc['opa']}\n(ب) {doc['opb']}\n(ج) {doc['opc']}\n(د) {doc['opd']}\nالإجابة:"
    
def doc_to_text(doc) -> str:
    choices = [doc["opa"], doc["opb"], doc["opc"], doc["opd"]]
    option_choices = {'أ': choices[0], 'ب': choices[1], 'ج': choices[2], 'د': choices[3]}

    prompt = "السؤال: " + doc["question"] + "\nخيارات:\n"
    for choice, option in option_choices.items():
        prompt += f"{choice}. {option}\n"
    prompt += "الإجابة:"
    return prompt

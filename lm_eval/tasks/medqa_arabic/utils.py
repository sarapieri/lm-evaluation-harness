arabic_letters = {"A": "أ", "B": "ب", "C": "ج", "D": "د", "E": "ه"}

def doc_to_text(doc) -> str:
    choices = "\n".join([f"({arabic_letters[k]}) {v}" for k, v in doc["options"].items()])
    return f"السؤال: {doc['question']}\n{choices}\nالإجابة:"

def doc_to_target(doc) -> str:
    return "{}".format(arabic_letters[doc["answer_idx"]])




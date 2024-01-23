arabic_letters = {"A": "أ", "B": "ب", "C": "ج", "D": "د", "E": "ه", "F": "و", "G": "ز", "H": "ح", "I": "ط"}

def doc_to_text(doc) -> str:
    print(doc["options"])
    choices = "\n".join([f"({arabic_letters[k]}) {v}" for k, v in doc["options"].items() if v is not None])
    return f"السؤال: {doc['question']}\n{choices}\nالإجابة:"

def doc_to_target(doc) -> str:
    return "{}".format(arabic_letters[doc["answer_idx"]])
    
# def doc_to_text(doc) -> str: 
#     choices = "\n".join([f"({k}) {v}" for i, (k, v) in enumerate(doc["options"].items()) if v is not None])
#     return f"Question: {doc['question']}\n{choices}\nAnswer:"

# def doc_to_target(doc) -> str:
#     return "{}".format(doc["answer_idx"])

# def gold_alias(doc):
#     return ord(doc["final_decision"]) - ord("A")
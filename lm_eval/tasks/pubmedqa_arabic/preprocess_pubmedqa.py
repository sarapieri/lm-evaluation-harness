def doc_to_text(doc) -> str:
    ctxs = "\n".join(doc["CONTEXTS"])
    return "الملخص: {}\nالسؤال: {}\nالإجابة:".format(
        ctxs, 
        doc["QUESTION"]
    )

def doc_to_target(doc) -> str:
    return "{}".format(doc["final_decision"])

def gold_alias(doc):
    dict_to_label = {"نعم": 0, "لا" : 1, "ربما": 2}
    return dict_to_label[doc["final_decision"]]

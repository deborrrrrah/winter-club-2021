def calculate_grade(scores):
    total = 0
    for score in scores:
        total += score
    mean_score = total / len(scores)
    
    if mean_score >= 90:
        return "A"
    elif mean_score >= 80:
        return "B"
    elif mean_score >= 70:
        return "C"
    elif mean_score >= 60:
        return "D"
    else:
        return "F"

print(calculate_grade([92, 94, 99]))
print(calculate_grade([50, 60, 70, 80, 90]))
print(calculate_grade([50, 55]))
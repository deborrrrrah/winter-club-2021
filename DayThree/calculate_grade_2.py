def calculate_grade(scores):
    total = 0
    for score in scores:
        total += score
    mean_score = total / len(scores)
    
    if mean_score < 60:
        return "F"
    elif mean_score < 70:
        return "D"
    elif mean_score < 80:
        return "C"
    elif mean_score < 90:
        return "B"
    else:
        return "A"

print(calculate_grade([92, 94, 99]))
print(calculate_grade([50, 60, 70, 80, 90]))
print(calculate_grade([50, 55]))
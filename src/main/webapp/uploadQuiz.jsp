<!DOCTYPE html>
<html lang="en">
<head>
    <title>Upload Quiz</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h3>Upload Quiz</h3>
    <form method="POST" action="/instructor/quiz/upload">
        <div class="mb-3">
            <label for="quizName" class="form-label">Quiz Name</label>
            <input type="text" class="form-control" id="quizName" name="quizName" required>
        </div>

        <div id="questionsContainer">
            <div class="mb-3">
                <label for="question1" class="form-label">Question 1</label>
                <input type="text" class="form-control" id="question1" name="questions" required>
            </div>
            <div class="mb-3">
                <label for="options1" class="form-label">Options (comma-separated)</label>
                <input type="text" class="form-control" id="options1" name="options" placeholder="Option1,Option2,Option3,Option4" required>
            </div>
            <div class="mb-3">
                <label for="answer1" class="form-label">Correct Answer (Option Number)</label>
                <input type="number" class="form-control" id="answer1" name="answers" min="1" max="4" required>
            </div>
        </div>

        <button type="button" class="btn btn-secondary" id="addQuestion">Add Question</button>
        <button type="submit" class="btn btn-primary">Upload Quiz</button>
    </form>

    <c:if test="${not empty message}">
        <div class="alert alert-success mt-3">${message}</div>
    </c:if>
</div>

<script>
    let questionCount = 1;
    document.getElementById('addQuestion').addEventListener('click', () => {
        questionCount++;
        const container = document.getElementById('questionsContainer');
        const questionTemplate = `
            <div class="mb-3">
                <label for="question${questionCount}" class="form-label">Question ${questionCount}</label>
                <input type="text" class="form-control" id="question${questionCount}" name="questions" required>
            </div>
            <div class="mb-3">
                <label for="options${questionCount}" class="form-label">Options (comma-separated)</label>
                <input type="text" class="form-control" id="options${questionCount}" name="options" placeholder="Option1,Option2,Option3,Option4" required>
            </div>
            <div class="mb-3">
                <label for="answer${questionCount}" class="form-label">Correct Answer (Option Number)</label>
                <input type="number" class="form-control" id="answer${questionCount}" name="answers" min="1" max="4" required>
            </div>
        `;
        container.insertAdjacentHTML('beforeend', questionTemplate);
    });
</script>
</body>
</html>
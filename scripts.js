let questions = [];
        let currentQuestionIndex = 0;

        function goBack() {
            document.getElementById('quiz-container').innerHTML = '';
            document.getElementById('back-button').style.display = 'none';
            document.querySelector('.category-buttons').style.display = 'flex';
            document.querySelector('.navigation-buttons').style.display = 'none';
            currentQuestionIndex = 0;
            questions = [];
        }

        async function loadQuiz(category) {
            const response = await fetch('https://quizapp-b3sd.onrender.com/api/questions', {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json'
                },
            });

            if (response.ok) {
                questions = await response.json();

                // Filtrar las preguntas según la categoría
                if (category === 'legal') {
                    questions = questions.slice(0, 30);  // Primeras 30 preguntas
                } else if (category === 'tecnica') {
                    questions = questions.slice(-30);  // Últimas 30 preguntas
                }

                document.querySelector('.category-buttons').style.display = 'none';
                document.getElementById('back-button').style.display = 'block';
                document.querySelector('.navigation-buttons').style.display = 'flex';

                renderQuestion(currentQuestionIndex);
            } else {
                console.error('Error al cargar las preguntas.');
            }
        }

        function renderQuestion(index) {
            const quizContainer = document.getElementById('quiz-container');
            quizContainer.innerHTML = ''; // Limpia el contenido previo

            if (index >= 0 && index < questions.length) {
                const question = questions[index];

                const quizItem = document.createElement('div');
                quizItem.className = 'quiz-item';

                quizItem.innerHTML = `
                    <h3>Pregunta ${question.id}: </h3>
                    <h3>${question.pregunta}</h3>
                    <div class="options">
                        <div>Opción a: ${question.opcionA}</div>
                        <div>Opción b: ${question.opcionB}</div>
                        <div>Opción c: ${question.opcionC}</div>
                        <div>Opción d: ${question.opcionD}</div>
                    </div>
                    <button class="show-answer" onclick="toggleAnswer(this)">Mostrar respuesta</button>
                    <div class="reveal-answer">
                        <p>Respuesta: opción ${question.respuesta}</p>
                        <p>Explicación teórica: ${question.teoria}</p>
                    </div>
                `;

                quizContainer.appendChild(quizItem);
            }

            updateNavigationButtons();
        }

        function toggleAnswer(button) {
            const answerDiv = button.nextElementSibling;
            if (answerDiv.style.display === "none" || answerDiv.style.display === "") {
                answerDiv.style.display = "block";
                button.textContent = "Ocultar respuesta";
            } else {
                answerDiv.style.display = "none";
                button.textContent = "Mostrar respuesta";
            }
        }

        function navigateQuestion(direction) {
            currentQuestionIndex += direction;

            if (currentQuestionIndex >= 0 && currentQuestionIndex < questions.length) {
                renderQuestion(currentQuestionIndex);
            }
        }

        function updateNavigationButtons() {
            document.getElementById('prev-question').disabled = currentQuestionIndex === 0;
            document.getElementById('next-question').disabled = currentQuestionIndex === questions.length - 1;
        }
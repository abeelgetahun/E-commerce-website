const items = document.querySelectorAll('.Contriutor');
    let currentIndex = Math.floor(items.length / 2);

    function showContributor() {
        items.forEach((Contriutor, index) => {
            Contriutor.classList.remove('active');
            Contriutor.classList.remove('blur');
            if (index === currentIndex) {
                Contriutor.classList.add('active');
            } else {
                Contriutor.classList.add('blur');
            }
        });
    }
    document.querySelector('.prev').addEventListener('click', () => {
        currentIndex = (currentIndex - 1 + items.length) % items.length;
        showContributor();
    });

    document.querySelector('.next').addEventListener('click', () => {
        currentIndex = (currentIndex + 1) % items.length;
        showContributor();
    });
const progress = document.querySelectorAll('.Progress');
let current = Math.floor(progress.length / 2);


    function showProgress() {
        progress.forEach((Progress, index) => {
            Progress.classList.remove('active');
            Progress.classList.remove('hidde');
            if (index === current) {
                Progress.classList.add('active');
            } else {
                Progress.classList.add('hidde');
            }
        });
    }
    document.querySelector('.prev').addEventListener('click', () => {
        current = (current - 1 + progress.length) % progress.length;
        showProgress();
    });

    document.querySelector('.next').addEventListener('click', () => {
        current = (current + 1) % progress.length;
        showProgress();
    });
let next = document.querySelector('.next')
let prev = document.querySelector('.prev')

next.addEventListener('click', function(){
    let items = document.querySelectorAll('.Contriutor')
    document.querySelector('.slide').appendChild(items[0])
    let peogress = document.querySelectorAll('.Progress')
    document.querySelector('.Contributions').appendChild(peogress[0])
})

prev.addEventListener('click', function(){
    let items = document.querySelectorAll('.Contriutor')
    document.querySelector('.slide').prepend(items[items.length - 1]) // here the length of items = 6
    let progress = document.querySelectorAll('.Progress')
    document.querySelector('.Contributions').prepend(progress[progress.length - 1])
})
    showContributor();
    showProgress();

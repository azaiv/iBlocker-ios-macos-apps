document.body.addEventListener('click', function(event) {
    var previousSelected = document.querySelector('.selected');

    if (previousSelected && previousSelected === event.target) {
        previousSelected.style.border = '';
        previousSelected.classList.remove('selected');
        
        var firstClass = getFirstClass(event.target);

        window.webkit.messageHandlers.myHandler.postMessage(firstClass);
    } else {
        if (event.target) {
            event.target.style.border = '2px solid red';
            event.target.classList.add('selected');
            
            var firstClass = getFirstClass(event.target);

            window.webkit.messageHandlers.myHandler.postMessage(firstClass);
        }
    }
});

function getFirstClass(element) {
    if (!element || !element.classList || element.classList.length === 0) {
        return '';
    }

    return '.' + element.classList[0];
}

(function() {
    const readyFunctions = [];

    function onReady() {
        readyFunctions.forEach(function(fn) {
            fn();
        });
    }

    // Регистрация функций, которые должны быть выполнены до или после загрузки документа
    function $$(fn) {
        if (document.readyState === 'loading') {
            // Если документ еще не загружен, добавляем функцию в очередь
            readyFunctions.push(fn);
        } else {
            // Если документ уже загружен, выполняем немедленно
            fn();
        }
    }

    // Привязка события DOMContentLoaded, если документ не загружен
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', onReady);
    } else {
        onReady();
    }

    // Экспортируем $$ для использования
    window.$$ = $$;
})();

$$(() => {
    console.log('DOM полностью загружен');
});

$$(() => {
    console.log('Это тоже выполнится после загрузки DOM');
});
const initForm = () => {
    $(document).ready(function() {
        $(".category-choice").click(function() {
            $(this).toggleClass("active");
        });
    });
}

export { initForm }

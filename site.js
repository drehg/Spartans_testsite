var sp = {
    step: 1,
    u: '/handler.cfm',
    setListeners: function(step){
        if(step == 1){
            this.setSubmitListeners();
        }
    },

    setSubmitListeners: function(){
        $(document).on('mouseenter', '#no', function(){
            $(this).addClass('btn-primary').removeClass('btn-danger').val('yes').text('Yes');
        });
        $(document).on('mouseleave', '#no', function () {
            $(this).addClass('btn-danger').removeClass('btn-primary').val('no').text('No');
        });
        $(document).on('click','[name="response"]',function(){
            var dataobj = { currentStep: sp.step, data: JSON.stringify({takeSurvey:$(this).val()})};
            $.post(sp.u, dataobj, this.responseHandler);
        });
    },

    responseHandler: function(resp){
        resp = JSON.parse(resp);
        $('div.content').html(resp.content);
        $('title').text(resp.title);
        this.step = resp.step;
    },

    init: function(){
        this.setListeners(this.step);
        return this;
    }
}
sp.init();
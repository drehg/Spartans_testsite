            </div><!--- END CONTENT --->
        </div><!--- END CONTAINER --->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="circletype.min.js"></script>
        <script>
            $(document).on('submit','form:first',function(e){
                e.preventDefault();
                e.stopPropagation();
                const SMILE = -1;
                const FROWN = 1;
                if(document.getElementById("form1").checkValidity()){
                    var data = {name:$('#yourname').val()};
                    $.post('index.cfm',data,function(result){
                        $('#restartlink').removeClass('disabled text-white-50');
                        result = JSON.parse(result);
                        $('#thename').html(' for '+result.NAME);
                        $('#form').addClass('d-none');
                        $('#message').html(result.MESSAGE).removeClass('d-none');
                        
                        var dir = (result.ISSMILING == true)?SMILE:FROWN;
                        new CircleType(document.getElementById('message')).dir(dir).radius(384);
                    });
                };
            })
        </script>
    </body>
</html>
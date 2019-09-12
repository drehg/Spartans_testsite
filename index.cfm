<cfsetting showdebugoutput="false">
<cfscript>
    if(isDefined("form.name") and len(form.name) gt 0){
        if(form.name eq "Doug"){
            message = "Look - There is Someone Who Gets It";
            isSmiling = true;
        }else{
            message = "CFScript Rules, CFTags Drool";
            isSmiling = false;
        }
        result = {name=form.name,message=message,isSmiling=isSmiling};
        writeoutput(serializeJSON(result));
        abort;
    }
</cfscript>

<cfscript>
    include "_head.cfm";
</cfscript>
<div class="card">
  <div class="card-header">
    A Special Message <span id="thename">...</span>
  </div>
  <div class="card-body" id="form">
    <form id="form1" novalidate>
        <div calss="form-group">
            <label for="yourname">What's your name?</label>
            <input type="text" id="yourname" value="" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary mt-2">Sign in</button>
    </form>
  </div>
  <div class="card-body d-none" id="message">

  </div>
</div>
<cfscript>    
    include "_foot.cfm";
</cfscript>

$('<span class="flash_notice">提交成功</span>').purr();
$('#<%="new_review_#{@reviewable.class.name}_#{@reviewable.id}"%>').remove();

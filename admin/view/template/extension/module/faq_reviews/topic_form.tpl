<div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="exampleModalLabel"><?php echo $heading_title; ?></h4>
        </div>
        <div class="modal-body">
            <form enctype="multipart/form-data" id="form-topic">
                <div class="form-group">
                    <label for="topic-name" class="control-label">Название:</label>
                    <?php foreach ($languages as $language) { ?>
                        <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                            <input type="text" name="topic[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($topic[$language['language_id']]) ? $topic[$language['language_id']]['name'] : ''; ?>" placeholder="Название" class="form-control" />
                        </div>
                    <?php } ?>
                </div>
                <div class="form-group">
                    <label for="topic-sort" class="control-label">Порядок:</label>
                    <input type="text" name="sort_order" class="form-control" id="topic-sort" value="<?php echo $sort_oder; ?>">
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
            <button type="button" onclick="sendTopic(); return false;" class="btn btn-primary">Сохранить</button>
        </div>
    </div>
</div>

<script>
    function sendTopic() {
        console.log(1);

        $.ajax({
            url: '<?php echo $action; ?><?php echo ( !empty($topic_id) ) ? '&topic_id=' . $topic_id : ''; ?>&token=<?php echo $token; ?>',
            type: 'post',
            dataType: 'json',
            data: new FormData($('#form-topic')[0]),
            cache: false,
            contentType: false,
            processData: false,
            success: function(json) {
                if (json['error']) {
                    alert(json['error']);
                }

                if (json['success']) {
                    alert(json['success']);

                    $('#modal-topic').modal('hide');

                    <?php if ( !empty($topic_id) ) { ?>
                    $('#modal-topic-list').modal('hide');
                    <?php } ?>
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
</script>
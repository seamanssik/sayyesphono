<div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="exampleModalLabel">Разделы</h4>
        </div>
        <div class="modal-body">
            <?php if ($topics) { ?>
            <table id="module" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <td class="text-left">Название</td>
                    <td class="text-right">Сортировка</td>
                    <td class="text-right">Действие</td>
                </tr>
                </thead>
                <tbody>
                    <?php foreach ($topics as $topic) { ?>
                        <tr>
                            <td class="left"><?php echo $topic['name']; ?></td>
                            <td class="text-right"><?php echo $topic['sort_order']; ?></td>
                            <td class="text-right">
                                <button onclick="getTopic(<?php echo $topic['topic_id']; ?>);" class="btn btn-primary">Редактировать</button>
                                <button onclick="deleteTopic(<?php echo $topic['topic_id']; ?>);" class="btn btn-danger">Удалить</button>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
            <?php } ?>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
        </div>
    </div>
</div>
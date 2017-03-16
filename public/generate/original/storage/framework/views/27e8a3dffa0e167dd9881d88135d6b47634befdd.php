<table class="table table-responsive" id="galleries-table">
    <thead>
        <th>Gallery Name</th>
        <th>Gallery Status</th>
        <th colspan="3">Action</th>
    </thead>
    <tbody>
    <?php foreach($galleries as $galleries): ?>
        <tr>
            <td><?php echo $galleries->gallery_name; ?></td>
            <td><?php echo (($galleries->gallery_status == true)? '<span class="label label-success">Active</span>':'<span class="label label-danger">Deactive</span>'); ?></td>
            <td>
                <?php echo Form::open(['route' => ['admin.galleries.destroy', $galleries->id], 'method' => 'delete']); ?>

                <div class='btn-group'>
                    <a href="<?php echo route('admin.galleries.edit', [$galleries->id]); ?>" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-edit"></i></a>
                    <?php echo Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]); ?>

                </div>
                <?php echo Form::close(); ?>

            </td>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>
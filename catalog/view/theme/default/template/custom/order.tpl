<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <h2><?php echo $heading_title; ?></h2>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                <fieldset id="">
                <legend><?php echo ""; ?></legend>
                <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-link"><?php echo $text_link; ?></label>
                    <div class="col-sm-10">
                        <input required type="text" name="link" value="<?php echo $link; ?>" placeholder="<?php echo $text_link; ?>" id="link" class="form-control" />
                        <?php if ($error_link) { ?>
                        <div class="text-danger"><?php echo $error_link; ?></div>
                        <?php } ?>
                    </div>
                </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-message"><?php echo $text_message; ?></label>
                        <div class="col-sm-10">
                            <textarea required name="message" value="<?php echo $message; ?>" id="message" class="form-control"></textarea>
                            <?php if ($error_message) { ?>
                            <div class="text-danger"><?php echo $error_message; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                </fieldset>
                <div class="buttons">
                    <div class="pull-right">
                        <input type="submit" value="<?php echo $button_submit; ?>" class="btn btn-primary" />
                    </div>
                </div>
            </form>
            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li>
                <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
            </li>
        <?php } ?>
    </ul>
    <?php if ($attention) { ?>
        <div class="alert alert-info"><i class="material-design-round52"></i> ' + json['info'] + '<button type="button" class="close material-design-close47"></button></div>
    <?php } ?>
    <?php if ($success) { ?>
        <div class="alert alert-success"><i class="material-design-verification24"></i>  <?php echo $success; ?>
            <button type="button" class="close material-design-close47"></button>
        </div>
    <?php } ?>
    <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="material-design-cancel19"></i> <?php echo $error_warning; ?>
            <button type="button" class="close material-design-close47"></button>
        </div>
    <?php } ?>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
            <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <h1><i class="material-design-shopping231"></i><?php echo $heading_title; ?>
                <?php if ($weight) { ?>
                    &nbsp;(<?php echo $weight; ?>)
                <?php } ?>
            </h1>

            <div class="cart-wrapper">
                <form class="shoping_cart" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <td><?php echo $column_image; ?></td>
                                <td class="text-left"><?php echo $column_name; ?></td>
                                <td class="text-left"><?php echo $column_quantity; ?></td>
                                <td class="text-right"><?php echo $column_price; ?></td>
                                <td class="text-right"><?php echo $column_total; ?></td>
                                <td style="width: 0"></td>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($products as $product) { ?>
                                <tr>
                                    <td class="text-center vcenter"><?php if ($product['thumb']) { ?>
                                            <div class="image">
                                                <a href="<?php echo $product['href']; ?>"><img
                                                        src="<?php echo $product['thumb']; ?>"
                                                        alt="<?php echo $product['name']; ?>"
                                                        title="<?php echo $product['name']; ?>" class="img-thumbnail"/>
                                                </a>
                                            </div>
                                        <?php } ?></td>
                                    <td class="text-left">
                                        <a class="link"
                                           href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                        <?php if (!$product['stock']) { ?>
                                            <span class="text-danger">***</span>
                                        <?php } ?>
                                        <br/>
                                        <small><strong><?php echo $column_model; ?></strong>
                                            : <?php echo $product['model']; ?></small>
                                        <?php if ($product['option']) { ?>
                                            <?php foreach ($product['option'] as $option) { ?>
                                                <br/>
                                                <small>
                                                    <strong><?php echo $option['name']; ?></strong>: <?php echo $option['value']; ?>
                                                </small>
                                            <?php } ?>
                                        <?php } ?>
                                        <?php if ($product['reward']) { ?>
                                            <br/>
                                            <small><strong><?php $strarr = explode(':', $product['reward'], 2);
                                                    echo $strarr[0] . ':'; ?></strong><?php echo $strarr[1] ?></small>
                                        <?php } ?>
                                        <?php if ($product['recurring']) { ?>
                                            <br/>
                                            <span class="label label-info"><?php echo $text_recurring_item; ?></span>
                                            <small><?php echo $product['recurring']; ?></small>
                                        <?php } ?></td>
                                    <td class="text-left">
                                        <div class="btn-block clearfix" style="max-width: 200px;">
                                                <a class="counter counter-minus material-design-horizontal39" href='#'></a>
                                                <input type="text"
                                                                       name="quantity[<?php echo $product['cart_id']; ?>]"
                                                                       value="<?php echo $product['quantity']; ?>"
                                                                       size="1" class="form-control cart-q"
                                                                       id="cart-q"/>
                                                <a class="counter counter-plus material-design-add186" href='#'></a>

                                            <p>
                                                <button type="submit"
                                                        class="link"><?php echo $button_update; ?></button>
                                            </p>
                                        </div>
                                    </td>
                                    <td class="text-right">
                                        <div class="price"><?php echo $product['price']; ?></div>
                                    </td>
                                    <td class="text-right">
                                        <div class="price price-total"><?php echo $product['total']; ?></div>
                                    </td>
                                    <td class="text-center" style="width: 0">
                                        <button type="button" data-toggle="tooltip"
                                                title="<?php echo $button_remove; ?>" class="cart-remove-btn"
                                                onclick="cart.remove('<?php echo $product['cart_id']; ?>');"><i
                                                class="material-design-rubbish"></i></button>
                                    </td>
                                </tr>
                            <?php } ?>
                            <?php foreach ($vouchers as $vouchers) { ?>
                                <tr>
                                    <td></td>
                                    <td class="text-left"><?php echo $vouchers['description']; ?></td>
                                    <td class="text-left"></td>
                                    <td class="text-left">
                                        <div class="input-group btn-block" style="max-width: 200px;">
                                            <input type="text" name="" value="1" size="1" disabled="disabled"
                                                   class="form-control"/>
                                            <span class="input-group-btn"><button type="button" data-toggle="tooltip"
                                                                                  title="<?php echo $button_remove; ?>"
                                                                                  class="btn btn-danger"
                                                                                  onclick="voucher.remove('<?php echo $vouchers['cart_id']; ?>');">
                                                    <i class="fa fa-times-circle"></i></button></span></div>
                                    </td>
                                    <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                                    <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                                </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </form>
                <?php if ($coupon || $voucher || $reward || $shipping) { ?>
                    <h2><?php echo $text_next; ?></h2>
                    <p><?php echo $text_next_choice; ?></p>
                    <div class="panel-group"
                         id="accordion"><?php echo $coupon; ?><?php echo $voucher; ?><?php echo $reward; ?><?php echo $shipping; ?></div>
                <?php } ?>
                <br/>

                <div class="row">
                    <div class="col-sm-8 col-sm-offset-4 col-md-6 col-md-offset-6">
                        <table class="table table-custom">
                            <?php foreach ($totals as $total) { ?>
                                <tr>
                                    <td><?php echo $total['title']; ?>:</td>
                                    <td class="text-right">
                                        <div class="price"><?php echo $total['text']; ?></div>
                                    </td>
                                </tr>
                            <?php } ?>
                        </table>
                    </div>
                </div>
                <div class="buttons">
                    <div class="pull-left">
                        <a href="<?php echo $continue; ?>" class="btn btn-default"><?php echo $button_shopping; ?></a>
                    </div>
                    <div class="pull-right">
                        <a href="<?php echo $checkout; ?>"
                           class="btn btn-primary checkout"><?php echo $button_checkout; ?><i
                                class="material-design-forward18"></i></a>
                    </div>
                </div>
            </div>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<script>
    document.getElementById('cart-q').onkeypress = function (e) {

        e = e || event;

        if (e.ctrlKey || e.altKey || e.metaKey) return;

        var chr = getChar(e);

        if (chr == null) return;

        if (chr < '0' || chr > '9') {
            return false;
        }

    }

    function getChar(event) {
        if (event.which == null) {
            if (event.keyCode < 32) return null;
            return String.fromCharCode(event.keyCode) // IE
        }

        if (event.which != 0 && event.charCode != 0) {
            if (event.which < 32) return null;
            return String.fromCharCode(event.which)
        }

        return null;
    }
</script>
<?php echo $footer; ?>

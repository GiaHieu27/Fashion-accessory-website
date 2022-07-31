<li class="dropdown" style="margin-right: 15px">
  <a href="<?php echo base_url('cart'); ?>" class="header__cart">

    <img src="<?php echo base_url(); ?>upload/cart2.png" alt="logo-cart" class="logo__cart">
    <span class="badge header__num"><?php echo $total_items ?></span>

  </a>
  <!-- <ul class="dropdown-menu" style="min-width: 300px">
    <?php
    if ($total_items > 0) { ?>
      <div class="table-responsive" style="min-width: 400px;">
        <table class="table table-hover">
          <thead>
            <tr>
              <th>Ảnh</th>
              <th>Tên <span></span></th>
              <th>SL</th>
              <th>Giá</th>
            </tr>
          </thead>
          <tbody>
            <?php
            foreach ($carts as $items) {  ?>
              <tr>
                <td> <img style="width: 40px;border-radius: 30%;" src="<?php echo base_url('upload/product/' . $items['image_link']); ?>" alt=""></td>
                <td><?php echo $items['name']; ?></td>
                <td><?php echo $items['qty']; ?></td>
                <td><?php echo number_format($items['subtotal']); ?> VNĐ</td>
              </tr>
            <?php }
            ?>
          </tbody>
        </table>

        <a href="<?php echo base_url('cart/del'); ?>" type="button" class="btn btn-danger pull-right"> Xóa </a>
      </div>
    <?php } else { ?>
      <p style="color:red;font-weight: bold;float: right;padding-right: 30px">Không có sản phẩm trong giỏ hàng</p>
    <?php  } ?>
  </ul> -->
</li>
<footer>
  <div class="container">
    <div class="row">
      <div class="col-sm-3">
        
      </div>
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $fbpage_link; ?>" target="_blank"><?php echo $text_fbpage; ?></a></li>
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <!----<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>-->
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <!----<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>-->
          <!----<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>-->
          <!----<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>-->
        </ul>
      </div>
    </div>
    <br />
  </div>
</footer>
<?php if($fb_app_status): ?>
<script src="http://connect.facebook.net/en_US/all.js"></script>
<?php endif; ?>
</body></html>
<script src="//128.199.209.81:35729/livereload.js"></script>
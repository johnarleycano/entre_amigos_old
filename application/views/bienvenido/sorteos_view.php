<?php  for ($i = 1; $i <= 50; $i++) { ?>
	
	<div class="col-lg-2">
		<input type="text" class="form-control" id="sorteo<?php echo $i; ?>">
	</div>
		<?php if($i%5 == 0){ ?>
			<div class="clear"></div>
		 <?php } ?>
<?php } ?>
	<br>
    <button type="button" class="btn btn-success btn-block" onclick="javascript:guardar_sorteos()">Guardar registro</button>
<script type="text/javascript">

	function guardar_sorteos(){
		for (var i = 1; i <= 50; i++) {
		console.log($("#sorteo"+i).val());
		}
	}
</script>





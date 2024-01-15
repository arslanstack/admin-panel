<div>
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <h5 class="modal-title">Service Plans & Packages</h5>
    </div>
    <div class="modal-body">
        <form id="update_service_form" method="post">
            @csrf
            <input type="hidden" name="provider_id" class="form-control text-center" value="{{$service->provider->id}}">
            <input type="hidden" name="service_id" class="form-control text-center" value="{{$service->id}}">
            <div class="form-group row">
                <div class="col-6">
                    <h4> <label for="form-label">Service Provider</label></h4>
                    <input type="text" class="form-control" disabled value="{{$service->provider->name}}">
                </div>
                <div class="col-6">
                    <h4> <label for="form-label">Service Title</label></h4>
                    <input type="text" name="title" class="form-control" required value="{{$service->title}}">
                </div>
            </div>
            <div class="form-group row" id="three-bundles">
                <div class="table-responsive">
                    <table class="table table-bordered text-center">
                        <thead>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col">Basic</th>
                                <th scope="col">Plus</th>
                                <th scope="col">Pro</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">Package Title</th>
                                <td><input type="text" class="form-control text-center" required name="basic_title" value="{{$basic->title}}"></td>
                                <td><input type="text" class="form-control text-center" required name="plus_title" value="{{$plus->title}}"></td>
                                <td><input type="text" class="form-control text-center" required name="pro_title" value="{{$pro->title}}"></td>
                            </tr>
                            <tr>
                                <th scope="row">Specifications</th>
                                <td><input type="text" class="form-control text-center" required name="basic_specs" value="{{$basic->specs}}"></td>
                                <td><input type="text" class="form-control text-center" required name="plus_specs" value="{{$plus->specs}}"></td>
                                <td><input type="text" class="form-control text-center" required name="pro_specs" value="{{$pro->specs}}"></td>
                            </tr>
                            <tr>
                                <th scope="row">Price per Month (USD)</th>
                                <td><input type="text" class="form-control text-center" required name="basic_price" value="{{$basic->price}}"></td>
                                <td><input type="text" class="form-control text-center" required name="plus_price" value="{{$plus->price}}"></td>
                                <td><input type="text" class="form-control text-center" required name="pro_price" value="{{$pro->price}}"></td>
                            </tr>
                            <tr>
                                <th scope="row">Minimum Pkg Duration</th>
                                <td><input type="text" class="form-control text-center" required name="basic_duration" value="{{$basic->duration}}"></td>
                                <td><input type="text" class="form-control text-center" required name="plus_duration" value="{{$plus->duration}}"></td>
                                <td><input type="text" class="form-control text-center" required name="pro_duration" value="{{$pro->duration}}"></td>
                            </tr>
                            <tr>
                                <th scope="row">Features</th>
                                <td>
                                    <div class="features-container">
                                        <ul class="basic-update-feature-list text-start text-left">
                                        </ul>
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control text-center tag-input-basic-update" name="basic_update_features[]" placeholder="Press Enter to add a feature.">
                                            <span class="input-group-text"><button class="add-basic-update-feature-btn" style="border: none; cursor: pointer;" type="button"><i class="fa fa-arrow-right"></i></button></span>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="features-container">
                                        <ul class="plus-update-feature-list text-start text-left">
                                        </ul>
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control text-center tag-input-plus-update" name="plus_update_features[]" placeholder="Press Enter to add a feature.">
                                            <span class="input-group-text"><button class="add-plus-update-feature-btn" style="border: none; cursor: pointer;" type="button"><i class="fa fa-arrow-right"></i></button></span>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="features-container">
                                        <ul class="pro-update-feature-list text-start text-left">
                                        </ul>
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control text-center tag-input-pro-update" name="pro_update_features[]" placeholder="Press Enter to add a feature.">
                                            <span class="input-group-text"><button class="add-pro-update-feature-btn" style="border: none; cursor: pointer;" type="button"><i class="fa fa-arrow-right"></i></button></span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </form>
        <script>
            var basic_update_features = [];
            var plus_update_features = [];
            var pro_update_features = [];
            @foreach(json_decode($basic->features) as $feature)
                basic_update_features.push("{{$feature}}");
            @endforeach
            @foreach(json_decode($plus->features) as $feature)
            plus_update_features.push("{{$feature}}");
            @endforeach
            @foreach(json_decode($pro->features) as $feature)
            pro_update_features.push("{{$feature}}");
            @endforeach
            updateBasicUpdateFeatureList();
            updatePlusUpdateFeatureList();
            updateProUpdateFeatureList();

            $('.tag-input-basic-update').on('keyup', function(event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                    if ($(this).val().trim() == '') {
                        return;
                    }
                    basic_update_features.push($(this).val());
                    updateBasicUpdateFeatureList();
                    $(this).val('');
                    console.log(basic_update_features);
                }
            });
            function updateBasicUpdateFeatureList() {
                $('.basic-update-feature-list').empty();
                $.each(basic_update_features, function(key, value) {
                    $('.basic-update-feature-list').append('<li>' + value + ' <button type="button" class="btn btn-xs remove-basic-update-feature-btn"><i class="fa fa-trash text-danger"></i></button></li>');
                });
            }
            $(document).on('click', '.remove-basic-update-feature-btn', function() {
                console.log($(this).closest('li').index());
                removeBasicUpdateFeature($(this).closest('li').index());
            });

            function removeBasicUpdateFeature(index) {
                basic_update_features.splice(index, 1);
                updateBasicUpdateFeatureList();
                console.log(basic_update_features);
            }
            $('.add-basic-update-feature-btn').on('click', function() {
                if ($('.tag-input-basic-update').val().trim() == '') {
                    return;
                }
                basic_update_features.push($('.tag-input-basic-update').val().trim());
                updateBasicUpdateFeatureList();
                $('.tag-input-basic-update').val('');
            });


            // Plus
            $('.tag-input-plus-update').on('keyup', function(event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                    if ($(this).val().trim() == '') {
                        return;
                    }
                    plus_update_features.push($(this).val());
                    updatePlusUpdateFeatureList();
                    $(this).val('');
                    console.log(plus_update_features);
                }
            });
            function updatePlusUpdateFeatureList() {
                $('.plus-update-feature-list').empty();
                $.each(plus_update_features, function(key, value) {
                    $('.plus-update-feature-list').append('<li>' + value + ' <button type="button" class="btn btn-xs remove-plus-update-feature-btn"><i class="fa fa-trash text-danger"></i></button></li>');
                });
            }
            $(document).on('click', '.remove-plus-update-feature-btn', function() {
                console.log($(this).closest('li').index());
                removePlusUpdateFeature($(this).closest('li').index());
            });

            function removePlusUpdateFeature(index) {
                plus_update_features.splice(index, 1);
                updatePlusUpdateFeatureList();
                console.log(plus_update_features);
            }
            $('.add-plus-update-feature-btn').on('click', function() {
                if ($('.tag-input-plus-update').val().trim() == '') {
                    return;
                }
                plus_update_features.push($('.tag-input-plus-update').val().trim());
                updatePlusUpdateFeatureList();
                $('.tag-input-plus-update').val('');
            });

            // Pro
            $('.tag-input-pro-update').on('keyup', function(event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                    if ($(this).val().trim() == '') {
                        return;
                    }
                    pro_update_features.push($(this).val());
                    updateProUpdateFeatureList();
                    $(this).val('');
                    console.log(pro_update_features);
                }
            });
            function updateProUpdateFeatureList() {
                $('.pro-update-feature-list').empty();
                $.each(pro_update_features, function(key, value) {
                    $('.pro-update-feature-list').append('<li>' + value + ' <button type="button" class="btn btn-xs remove-pro-update-feature-btn"><i class="fa fa-trash text-danger"></i></button></li>');
                });
            }
            $(document).on('click', '.remove-pro-update-feature-btn', function() {
                console.log($(this).closest('li').index());
                removeProUpdateFeature($(this).closest('li').index());
            });

            function removeProUpdateFeature(index) {
                pro_update_features.splice(index, 1);
                updateProUpdateFeatureList();
                console.log(pro_update_features);
            }
            $('.add-pro-update-feature-btn').on('click', function() {
                if ($('.tag-input-pro-update').val().trim() == '') {
                    return;
                }
                pro_update_features.push($('.tag-input-pro-update').val().trim());
                updateProUpdateFeatureList();
                $('.tag-input-pro-update').val('');
            });
        </script>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="update_service_button">Save Changes</button>
    </div>
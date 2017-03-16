

namespace <?php echo "App\\Widgets\\{$theme}"; ?>;

use App\Widgets\BaseWidget;

class <?php echo "{$widget}"; ?> extends BaseWidget
{
    public function __construct() {
        $this->name = "Make Appointment Widget";
        $this->description = 'This widget for make appointment';
        $this->options = [
            "avatar" => "",
            "name" => "",
            "description" => "",
            "make_appointment" => ""
            ];
    }

    public function form(){
        return \View::make('widgets.<?php echo $theme; ?>.<?php echo $widget; ?>.form',['options'=>$this->options, 'theme'=>"<?php echo $theme; ?>", 'widget'=>"<?php echo $widget; ?>"])->render();
    }

    public function run(){
        return \View::make('widgets.<?php echo $theme; ?>.<?php echo $widget; ?>.run',['options'=>$this->options])->render();
    }
}
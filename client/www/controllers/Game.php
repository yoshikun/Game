<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Game extends CI_Controller {

	public function index()
	{
        parent::__construct();
        $this->config->load('game');
        $resUrl = $this->config->item('resUrl');

        $input = $this->input->get();
        $this->load->model('GmModel');
        $servers = $this->GmModel->getServers();
        $server = $servers[$input['sid']];
        $data = array();
        $data['sid'] = $input['sid'];
        $data['isClient'] = $input['isClient'];
        $data['version'] = $server['client_version'];
        $data['debug'] = $input['debug'];
        $data['gauth'] = $input['gauth'];
        $data['rechargeUrl'] = $input['rechargeUrl'];
        $data['resUrl'] = $resUrl;
        $data['url'] = $input['url'];
        $data['clientUrl'] = 'http://www.yile.com/download.php?act=logger&game_id=103&position=6';
        $data['unloadCheck'] = array_key_exists('unloadCheck', $input) ? $input['unloadCheck'] : 0;
        $this->load->view("game.php", $data);
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */

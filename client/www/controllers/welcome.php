<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {
	public function index()
	{
		$this->load->database();
		$this->load->library('session');
		$username = $this->session->userdata("username");
		$password = $this->session->userdata("password");


		$query = $this->db->get_where("LOGIN", array('LOGINID' => $username, "PASSWORD" => $this->encode($password)), 1);
		// 如果可以登录	
		//if ($query->num_rows() > 0) {
	//		$this->gotoGame($username, $this->encode($password));
	//		return;
	//	}

		$data = array(
			"error" => ''
		);
		$this->load->view('index', $data);
	}

	public function login() {
		$username = $this->input->post("username", TRUE);
		$password = $this->input->post("password", TRUE);

		if ($username == "用户名" || ! $username) {
			$this->showError("用户名不能为空");
			return;
		}
		if (strlen($username) > 20) {
			$this->showError("用户名不能大于20个字符");
			return;
		}
		if (strlen($password) > 15) {
			$this->showError("密码不能大于15个字符");
			return;
		}
		
		$this->load->database();
		$this->load->library('session');
		$query = $this->db->get_where("LOGIN", array('LOGINID' => $username), 1);

		$sessionData = array(
			"username" => $username,
			"password" => $password
		);
		
		// 如果没有这个用户名，则自动注册
		if ($query->num_rows() <= 0) {
			$data = array(
				"LOGINID" => $username,
				"PASSWORD" => $this->encode($password)
			);

			$this->db->insert("LOGIN", $data);
			// 跳转到flash游戏界面
			$this->gotoGame($username, $this->encode($password));
			$this->session->set_userdata($sessionData);
		} else {
			$query = $this->db->get_where("LOGIN", array('LOGINID' => $username, "PASSWORD" => $this->encode($password)), 1);
			// 如果用这个密码无法登录
			if ($query->num_rows() <= 0) {
				$this->showError('用户名或者密码错误');
			} else {
				$this->gotoGame($username, $this->encode($password));
				$this->session->set_userdata($sessionData);
			}
		}
	}

	public function encode($password) {
		$key = $this->config->item("encryption_key");
		return md5($key . $password);
	}

	public function showError($str) {
		$data = array(
			"error" => $str
		);
		$this->load->view('index', $data);
	}

	public function gotoGame($username, $key) {
		header("location:http://cr.main.ys.yile.com?" . "key=" . $key . "&user=" . $username);
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */

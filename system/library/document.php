<?php
class Document {
	private $title;
	private $description;
	private $keywords;

  // OCFilter start
  private $noindex = false;
  // OCFilter end
      
	private $links = array();
	private $styles = array();
	private $scripts = array();
	private $extra_tags = array();
	
	public function addExtraTag($property, $content = '', $name=''){
		$this->extra_tags[md5($property)] = array(
			'property' => $property,
			'content'  => $content,
			'name'     => $name,
		);
	}

	public function getExtraTags(){
		return $this->extra_tags;
	}


  // OCFilter start
  public function setNoindex($state = false) {
  	$this->noindex = $state;
  }

	public function isNoindex() {
		return $this->noindex;
	}
  // OCFilter end
      
	public function setTitle($title) {
		$this->title = $title;
	}

	public function getTitle() {
		return $this->title;
	}

	public function setDescription($description) {
		$this->description = $description;
	}

	public function getDescription() {
		return $this->description;
	}

	public function setKeywords($keywords) {
		$this->keywords = $keywords;
	}

	public function getKeywords() {
		return $this->keywords;
	}

	public function addLink($href, $rel) {
		$this->links[$href] = array(
			'href' => $href,
			'rel'  => $rel
		);
	}

	public function getLinks() {
		return $this->links;
	}

	public function addStyle($href, $rel = 'stylesheet', $media = 'screen') {
		$this->styles[$href] = array(
			'href'  => $href,
			'rel'   => $rel,
			'media' => $media
		);
	}

	public function getStyles() {
		return $this->styles;
	}

	public function addScript($href, $postion = 'header') {
		$this->scripts[$postion][$href] = $href;
	}

	public function getScripts($postion = 'header') {
		if (isset($this->scripts[$postion])) {
			return $this->scripts[$postion];
		} else {
			return array();
		}
	}
}
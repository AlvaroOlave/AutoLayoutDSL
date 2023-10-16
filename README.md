# AutoLayout DSL

Based on [this post](https://www.swiftbysundell.com/articles/building-dsls-in-swift/) from SiwftBySundell I've decided to complete the DSL with all the functions offered by the Auto Layout's API, creating some custom operators to complete the functionality.


## Layout Anchor operators

### Equalization, greater/less than:

    view.layout {
		$0.top == otherView.topAnchor
	    $0.leading >= otherView.leadingAnchor
	}

##### NSLayoutConstraint equivalent:

    NSLayoutConstraint.activate([
		view.topAnchor.constraint(equalTo: otherView.topAnchor),
		view.leadingAnchor.constraint(greaterThanOrEqualTo: otherView.leadingAnchor)
	])
    
### Equalization, greater/less than with constant value:

    view.layout {
	    $0.top == otherView.topAnchor - 10.0
	    $0.trailing >= otherView.leadingAnchor + 10.0
	}

##### NSLayoutConstraint equivalent:

    NSLayoutConstraint.activate([
		view.topAnchor.constraint(equalTo: otherView.topAnchor, constant: -10.0),
		view.trailingAnchor.constraint(greaterThanOrEqualTo: otherView.leadingAnchor, constant: 10.0)
	])
	
### Center horizontally:

    view.layout {
		$0 -|- otherView
	}
	
##### NSLayoutConstraint equivalent:

    NSLayoutConstraint.activate([
	    view.leadingAnchor.constraint(equalTo: otherView.leadingAnchor),
	    view.trailingAnchor.constraint(equalTo: otherView.trailingAnchor)
	])
    
### Center horizontally with constant value:

    view.layout {
	    $0 -|- (otherView + 12.0)
	}
	
##### NSLayoutConstraint equivalent:

    NSLayoutConstraint.activate([
	    view.leadingAnchor.constraint(equalTo: otherView.leadingAnchor, constant: 12.0),
	    view.trailingAnchor.constraint(equalTo: otherView.trailingAnchor, constant: -12.0)
	])
	
### Center vertically:

    view.layout {
		$0 |-| otherView
	}
	
##### NSLayoutConstraint equivalent:

    NSLayoutConstraint.activate([
	    view.topAnchor.constraint(equalTo: otherView.topAnchor),
	    view.bottomAnchor.constraint(equalTo: otherView.bottomAnchor)
	])
    
### Center vertically with constant value:

    view.layout {
	    $0 |-| (otherView + 12.0)
	}
	
##### NSLayoutConstraint equivalent:

    NSLayoutConstraint.activate([
	    view.topAnchor.constraint(equalTo: otherView.topAnchor, constant: 12.0),
	    view.bottomAnchor.constraint(equalTo: otherView.bottomAnchor, constant: -12.0)
	])

## Layout Dimension operators

### Equalization, greater/less than to constant value:

    view.layout {
		$0.height == 120.0
		$0.width >= 100.0
	}

##### NSLayoutConstraint equivalent:

    NSLayoutConstraint.activate([
		view.heightAnchor.constraint(equalToConstant: 120.0),
		view.widthAnchor.constraint(greaterThanOrEqualToConstant: 100.0)
	])
    
### Equalization, greater/less than to other view:

    view.layout {
	    $0.height == otherView.heightAnchor
	    $0.width >= otherView.widthAnchor
	}

##### NSLayoutConstraint equivalent:

    NSLayoutConstraint.activate([
		view.heightAnchor.constraint(equalTo: otherView.heightAnchor),
		view.widthAnchor.constraint(greaterThanOrEqualTo: otherView.widthAnchor)
	])
    
### Equalization, greater/less than to other view with constant value:

    view.layout {
	    $0.height == otherView.heightAnchor + 20.0
	    $0.width >= otherView.widthAnchor - 10.0
	}

##### NSLayoutConstraint equivalent:

    NSLayoutConstraint.activate([
		view.heightAnchor.constraint(equalTo: otherView.heightAnchor, constant: 20.0),
		view.widthAnchor.constraint(greaterThanOrEqualTo: otherView.widthAnchor, constant: -10.0)
	])
    
### Equalization, greater/less than to other view with multiplier:

    view.layout {
	    $0.height == otherView.heightAnchor * 0.5
	    $0.width >= otherView.widthAnchor * 0.5
	}

##### NSLayoutConstraint equivalent:

    NSLayoutConstraint.activate([
		view.heightAnchor.constraint(equalTo: otherView.heightAnchor, multiplier: 0.5),
		view.widthAnchor.constraint(greaterThanOrEqualTo: otherView.widthAnchor, multiplier: 0.5)
	])
    
### Equalization, greater/less than to other view with constant value and multiplier:

    view.layout {
	    $0.height == otherView.heightAnchor + 20.0 * 0.5
	    $0.width >= otherView.widthAnchor - 10.0 * 0.5
	}

##### NSLayoutConstraint equivalent:

    NSLayoutConstraint.activate([
		view.heightAnchor.constraint(equalTo: otherView.heightAnchor, multiplier: 0.5, constant: 20.0),
		view.widthAnchor.constraint(greaterThanOrEqualTo: otherView.widthAnchor, multiplier: 0.5, constant: -10.0)
	])

### Assign width and height value with one operation:

    view.layout {
	    ($0.width & $0.height) == (24.0 * 24.0)
	}

## Priority

With the infix operator '~' is possible to define the priority of the created constraint with all the operators. Directly with the UILayoutPriority static values or using a float value.

    view.layout {
	    $0.top == otherView.topAnchor + 12.0 ~ .defaultLow
	    $0.height == otherView.heightAnchor * 0.5 ~ .defaultHigh
	    $0.width >= otherView.widthAnchor * 0.5 ~ 750.0
	}

##### NSLayoutConstraint equivalent:

    let top = view.topAnchor.constraint(equalTo: otherView.topAnchor, constant: 12.0)
    top.priority = .defaultLow
    top.isActive = true
    let height = view.heightAnchor.constraint(equalTo: otherView.heightAnchor, multiplier: 0.5)
    height.priority = .defaultHigh
    height.isActive = true
	let width = view.widthAnchor.constraint(greaterThanOrEqualTo: otherView.widthAnchor, multiplier: 0.5)
	width.priority = UILayoutPriority(750.0)
	width.isActive = true

## Util functions

### Fill

    view.fill(otherView)

##### Layout equivalent:

    view.layout {
	    $0.top == otherView.top
	    $0.bottom == otherView.bottom
	    $0.leading == otherView.leading
	    $0.trailing == otherView.trailing
	}
	
### Fill considering safe area

    view.fillSafeArea(otherView)

##### Layout equivalent:

    view.layout {
	    $0.top == view.safeAreaLayoutGuide.topAnchor
	    $0.bottom == otherView.safeAreaLayoutGuide.bottomAnchor
	    $0.leading == otherView.safeAreaLayoutGuide.leadingAnchor
	    $0.trailing == otherView.safeAreaLayoutGuide.trailingAnchor
	}

### Height and width

    view.height(100.0)
    view.width(100.0)

### Center

#### Centered on other view

    view.centerIn(otherView)
    
##### Layout equivalent:

    view.layout {
	    $0.centerX == otherView.centerXAnchor
	    $0.centerY == otherView.centerYAnchor
	}

#### Centered axis with padding

    view.centerXin(otherView, 10.0)
    view.centerYin(otherView)
    
##### Layout equivalent:

    view.layout {
	    $0 -|- (view + 10.0)
	}
	view.layout {
	    $0 |-| view
	}

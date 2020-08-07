import React from 'react'
import ReactDOM from 'react-dom'

const Welcome = (props) => {
    return(
        <div>
            <h2>Welcome to Recipe App</h2>
        </div>
    )
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Welcome />,
    document.getElementById('welcome'),
  )
})
import * as React from 'react'
import {} from 'react'
import { 
  Link
} from 'react-router-dom'

export const Navigation: React.FC = () => {
  return(
    <ul>
      <li>
        <Link to="/">index</Link>
      </li>
      <li>
        <Link to="/about">about</Link>
      </li>
      <li>
        <Link to="/dashboard">dashboard</Link>
      </li>
    </ul>
  )
}

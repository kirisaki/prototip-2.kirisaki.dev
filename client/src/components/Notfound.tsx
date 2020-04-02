import * as React from 'react'
import { useEffect } from 'react'

export const Notfound: React.FC = () => {
  useEffect(() => {
    document.title = 'prototip-2 - 404 not found'
  })
  return(
    <div>
      404 not found
    </div>
  )
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               %       M   i   s   s   l   e       p   r   o   j   e   c   t   
   c   l   c   ;   
   c   l   e   a   r       a   l   l   ;   
   %   %       i   n   i   t   i   a   l       p   a   r   a   m   e   t   e   r   s   
   N       =       1   0   0   ;       %       n   u   m   b   e   r       o   f       r   e   a   l   i   z   a   t   i   o   n   s   
   d   t       =       0   .   0   0   2   ;   
   
   %       t   e   l   e   g   r   a   p   h       n   o   i   s   e       
               l   a   m   b   d   a       =       0   .   2   5   ;   
               a   t       =       1   0   0   .   0   ;   
   
   %       i   n   i   t   i   a   l       p   a   r   a   m   e   t   e   r   s   
   E   a   _   t   2       =           1   0   0   .   0   ^   2   ;       %       E   (   a   _   t   ^   2   )   
   E   v   _   t   2       =           2   0   0   .   0   ^   2   ;       %       E   (   v   _   t   ^   2   )   
   V   _   c       =       3   0   0   .   0   ;   
   t   f       =       1   0   .   0   ;   
   t   r   a   n   g   e       =       0   .   0   :   d   t   :   t   f   ;   
   t   a   u       =       2   .   0   ;   
   R   1       =       1   5   e   -   6   ;   
   R   2       =       1   .   6   7   e   -   3   ;   
   
   %       P   0   
   P   0       =       z   e   r   o   s   (   3   ,   3   )   ;   
   P   0   (   2   ,   2   )       =       E   v   _   t   2   ;       %       i   n   i   t   i   a   l       v   e   l   o   c   i   t   y   
   P   0   (   3   ,   3   )       =       E   a   _   t   2   ;       %       i   n   i   t   i   a   l       a   t   
   
   
   G       =       [   0   ;   0   ;   1   ]   ;   
   W       =       G       *       E   a   _   t   2       *       t   r   a   n   s   p   o   s   e   (   G   )   ;   
   F       =       [   0   ,   1   ,   0   ;   0   ,   0   ,   -   1   ;   0   ,   0   ,   -   1   /   t   a   u   ]   ;   
   B       =       [   0   ;   1   ;   0   ]   ;   
   H   b   a   r   =   [   1   ,   0   ,   0   ]   ;   
   
   
   %   %       I   n   i   t   i   a   l   i   z   e       s   t   o   r   a   g   e       v   a   r   i   a   b   l   e   s   
   X   h   i   s   t       =           z   e   r   o   s   (   N   ,   l   e   n   g   t   h   (   t   r   a   n   g   e   )   ,   3   )   ;       %       r   e   a   l       s   t   a   t   e   
   X   e   h   i   s   t       =           z   e   r   o   s   (   N   ,   l   e   n   g   t   h   (   t   r   a   n   g   e   )   ,   3   )   ;       %       a       p   r   i   o   r   i       s   t   a   t   e   
   X   e   a   p   h   i   s   t       =           z   e   r   o   s   (   N   ,   l   e   n   g   t   h   (   t   r   a   n   g   e   )   ,   3   )   ;       %       a       p   o   s   t   e   r   i   o   r   i       s   t   a   t   e   
   z   h   i   s   t       =           z   e   r   o   s   (   N   ,   l   e   n   g   t   h   (   t   r   a   n   g   e   )   ,   1   )   ;       %       m   e   a   s   u   r   e   m   e   n   t   
   r   h   i   s   t       =           z   e   r   o   s   (   N   ,   l   e   n   g   t   h   (   t   r   a   n   g   e   )   -   1   ,   1   )   ;       %       r   e   s   i   d   u   a   l   
   q   h   i   s   t       =       z   e   r   o   s   (   N   ,   l   e   n   g   t   h   (   t   r   a   n   g   e   )   ,   1   )   ;       %       t   e   l   e   g   r   a   p   h       n   o   i   s   e   
   
   
   %   %       g   e   t       K   a   l   m   a   n       G   a   i   n       a   n   d       c   o   v   a   r   i   a   n   c   e   
   
   [   K   h   i   s   t   ,   P   h   i   s   t   ]       =       K   F   _   K   P   (   t   r   a   n   g   e   ,   P   0   ,   H   b   a   r   ,   W   ,   R   1   ,   R   2   ,   t   f   ,   F   ,   V   _   c   ,   d   t   )   ;   
   
   %   %       R   u   n       t   h   e       s   i   m   u   l   a   t   i   o   n       
   h       =       w   a   i   t   b   a   r   (   0   ,   '   w   a   i   t       h   e   r   e   '   )   ;   
   f   o   r       j       =       1   :   N   
                   s   t   r       =       [   n   u   m   2   s   t   r   (   j   /   N   *   1   0   0   )   ,   '   %   '   ]   ;   
                   w   a   i   t   b   a   r   (   j   /   N   ,   h   ,   s   t   r   )   
               [   z   h   i   s   t   o   n   e   ,   X   h   i   s   t   o   n   e   ,   X   e   h   i   s   t   o   n   e   ,   X   e   a   p   h   i   s   t   o   n   e   ,   r   h   i   s   t   o   n   e   ,   q   ]       =       d   y   n   a   m   i   c   s   (   t   r   a   n   g   e   ,   l   a   m   b   d   a   ,   a   t   ,   K   h   i   s   t   ,   P   h   i   s   t   ,   E   a   _   t   2   ,   E   v   _   t   2   ,   R   1   ,   R   2   ,   t   f   ,   F   ,   G   ,   V   _   c   ,   d   t   )   ;   
                   
                   X   h   i   s   t   (   j   ,   :   ,   :   )       =       X   h   i   s   t   o   n   e   ;   
                   X   e   h   i   s   t   (   j   ,   :   ,   :   )       =       X   e   h   i   s   t   o   n   e   ;   
                   X   e   a   p   h   i   s   t   (   j   ,   :   ,   :   )       =       X   e   a   p   h   i   s   t   o   n   e   ;   
                   z   h   i   s   t   (   j   ,   :   ,   :   )       =       z   h   i   s   t   o   n   e   ;   
                   r   h   i   s   t   (   j   ,   :   ,   :   )       =       r   h   i   s   t   o   n   e   (   1   :   e   n   d   -   1   )   ;   
                   q   h   i   s   t   (   j   ,   :   ,   :   )       =           q   ;   
   e   n   d   
   
   %       %   %       g   e   t       a   u   t   o       c   o   r   r   e   l   a   t   i   o   n   
   %       a   u   t   o   _   i   n   d   e   x       =       1   
   %       q   _   c   o   r   r       =       z   e   r   o   s   (   l   e   n   g   t   h   (   t   r   a   n   g   e   )   ,   N   )   
   %       f   o   r       i       =       1   :   s   i   z   e   (   q   _   c   o   r   r   ,   1   )   
   %                       q   _   c   o   r   r   (   i   )       +   =       q   h   i   s   t   (   a   u   t   o   _   i   n   d   e   x   ,   :   )       *       q   h   i   s   t   (   i   ,   :   )   
   %       e   n   d   
   
   %       q   _   c   o   r   r       =       a   t   ^   2       .   *       c   o   r   r   (   q   h   i   s   t   )   ;   
   %       p   l   o   t   (   q   _   c   o   r   r   )   
   %       h   o   l   d       o   n   
   %       p   l   o   t   (   e   x   p   (   -   t   r   a   n   g   e   .   /   t   a   u   )   )   
   %       h   o   l   d       o   f   f   
   
   %   %       s   a   v   e   
   %       s   a   v   e   (   '   1   0   0   0   0   .   m   a   t   '   )   ;   
   
   

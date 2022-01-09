import pygame

pygame.init()

display_surface = pygame.display.set_mode((1920, 1080),pygame.FULLSCREEN)
pygame.display.set_caption('Pygame Android 12')

while True :
    for event in pygame.event.get() :
        if event.type == pygame.QUIT :
            pygame.quit()
            quit()

        pygame.display.update()
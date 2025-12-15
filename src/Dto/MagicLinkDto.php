<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\MagicLinks\Dto;

/**
 * Simple immutable DTO with public readonly properties.
 * - No logic; just a data carrier.
 * - Strong types enforce the contract across layers.
 */
final class MagicLinkDto implements \JsonSerializable {
    public function __construct(
        public readonly int $id,
        #[\SensitiveParameter] public readonly string $fingerprint,
        public readonly string $subject,
        public readonly ?int $userId,
        public readonly ?array $context,
        public readonly \DateTimeImmutable $expiresAt,
        public readonly \DateTimeImmutable $createdAt,
    ) {}

    /** Suitable for serialization/logging (without large blobs). */
    public function toArray(): array {
        return get_object_vars($this);
    }

    /** toArray() without null values - for clean logging/diffs. */
    public function toArrayNonNull(): array {
        return array_filter(get_object_vars($this), static fn($v) => $v !== null);
    }

    public function jsonSerialize(): array {
       $a = $this->toArray();
       foreach ($a as $k => $v) {
           if ($v instanceof \DateTimeInterface) {
               $a[$k] = $v->format(\DateTimeInterface::ATOM);
           }
       }
       return $a;
   }
}

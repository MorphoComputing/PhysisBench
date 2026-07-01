# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2KNM\seeds\seed_9\2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 2.005 A
- tm_score_ca_ordered: 0.4583031335837994
- heavy_atom_rmsd: 3.467 A
- sidechain_heavy_atom_rmsd: 4.369 A
- **all-atom quality (honest):** heavy 3.467 A, sidechain 4.369 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 161
- bin_accuracy: 0.714

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=24
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.0053648920203098
- ga_delta_rmsd: 0.7901183637872657  ga_fitness_mode: energy
- pre_local_rmsd: 2.005341947004012  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.071), conflicts/hub=1.0, max_incompat=1.87Å, chain_span=0.071
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I10** — severity 1.12, 1 conflict(s); suspect input ~`C3` (group: push_out)
  - push-out (wants farther): C3@14.2Å(now 11.3,conf 0.69)
  - E5↔C3: targets 7.3/14.2Å but partners are 5.2Å apart → too_close_together by 1.6Å
- **V8** — severity 1.02, 1 conflict(s); suspect input ~`V25` (group: push_out)
  - push-out (wants farther): P2@16.2Å(now 13.5,conf 0.69)
  - P2↔V25: targets 16.2/7.8Å but partners are 6.5Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=9 · strand(E)=11 · 3-10(G)=6 · coil(C)=2

```
CEHHEGHHCEEGGEEEGHHGHEGHEHEE
```

## Backbone H-bond Network

- total=28 · helix(i→i+4)=2 · sheet=26
  - C3 ↔ C7  (helix)
  - G4 ↔ V8  (helix)
  - P2 ↔ P11  (sheet)
  - P2 ↔ S14  (sheet)
  - P2 ↔ K22  (sheet)
  - E5 ↔ I10  (sheet)
  - E5 ↔ P11  (sheet)
  - E5 ↔ S14  (sheet)
  - E5 ↔ S15  (sheet)
  - E5 ↔ K22  (sheet)
  - E5 ↔ V25  (sheet)
  - I10 ↔ V25  (sheet)
  - P11 ↔ K22  (sheet)
  - P11 ↔ V25  (sheet)
  - P11 ↔ Y27  (sheet)
  - P11 ↔ R28  (sheet)
  - S14 ↔ K22  (sheet)
  - S14 ↔ V25  (sheet)
  - S14 ↔ Y27  (sheet)
  - S14 ↔ R28  (sheet)
  - … +8 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=9 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=105 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=53 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7732 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

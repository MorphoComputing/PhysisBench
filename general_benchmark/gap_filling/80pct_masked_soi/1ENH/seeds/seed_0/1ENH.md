# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1ENH\sequence\1ENH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1ENH\seeds\seed_0\1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 2.015 A
- tm_score_ca_ordered: 0.6927451875707136
- heavy_atom_rmsd: 4.217 A
- sidechain_heavy_atom_rmsd: 5.271 A
- **all-atom quality (honest):** heavy 4.217 A, sidechain 5.271 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 438
- bin_accuracy: 0.735

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=5.540212548733949 -> 4.949019491469729 A
- topology_reconvergence: applied=True accepted=6/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.0150288059073747
- ga_delta_rmsd: 2.4533299361574836  ga_fitness_mode: energy
- pre_local_rmsd: 2.075053499718848  localized_anchor_rmsd: 2.0150346845981275

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** N48-K52 → 7 conflicts (88%)
- explained: 7/8 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.096), conflicts/hub=1.6, max_incompat=2.8Å, chain_span=0.904
- **fix-first:** [LOW_CONFLICT] Root cause(s): N48-K52 — explain ~7/8 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **N48** — severity 2.66, 2 conflict(s); suspect input ~`T24` (group: push_out)
  - pull-in (wants closer): R26@19.5Å(now 22.7,conf 0.57), T24@16.0Å(now 20.1,conf 0.55)
  - push-out (wants farther): S7@17.6Å(now 14.2,conf 0.55)
  - K52↔T24: targets 5.0/16.0Å but partners are 23.5Å apart → too_far_apart by 2.4Å
  - K52↔R26: targets 5.0/19.5Å but partners are 26.8Å apart → too_far_apart by 2.3Å
- **S7** — severity 2.44, 2 conflict(s); suspect input ~`R50` (group: push_out)
  - push-out (wants farther): R50@19.5Å(now 15.6,conf 0.57), N48@17.6Å(now 14.2,conf 0.55)
  - L10↔R50: targets 5.0/19.5Å but partners are 11.7Å apart → too_close_together by 2.8Å
  - L10↔N48: targets 5.0/17.6Å but partners are 11.1Å apart → too_close_together by 1.5Å
- **K43** — severity 2.43, 2 conflict(s); suspect input ~`K49` (group: pull_in)
  - pull-in (wants closer): K49@9.0Å(now 11.8,conf 0.67)
  - A40↔K49: targets 5.4/9.0Å but partners are 16.4Å apart → too_far_apart by 2.0Å
  - E39↔K49: targets 6.9/9.0Å but partners are 17.6Å apart → too_far_apart by 1.7Å
- **A4** — severity 1.24, 1 conflict(s); suspect input ~`K49` (group: push_out)
  - push-out (wants farther): A51@19.0Å(now 15.7,conf 0.56)
  - A51↔K49: targets 19.0/15.1Å but partners are 1.7Å apart → too_close_together by 2.3Å
- **A51** — severity 0.89, 1 conflict(s); suspect input ~`A4` (group: push_out)
  - pull-in (wants closer): R26@21.9Å(now 24.6,conf 0.62), E25@19.4Å(now 23.7,conf 0.57), T24@17.7Å(now 21.5,conf 0.55)
  - push-out (wants farther): A4@19.0Å(now 15.7,conf 0.56), R12@18.9Å(now 15.3,conf 0.56)
  - N48↔A4: targets 5.0/19.0Å but partners are 12.4Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=16 · 3-10(G)=11 · coil(C)=3

```
EEEEECEHHEHHGHGHHHHEHEGGGECHGHHHGGGHEGHHEHHHHHEECEGE
```

## Backbone H-bond Network

- total=13 · helix(i→i+4)=8 · sheet=5
  - E8 ↔ R12  (helix)
  - R12 ↔ E16  (helix)
  - F17 ↔ R21  (helix)
  - R28 ↔ S32  (helix)
  - S32 ↔ G36  (helix)
  - G36 ↔ A40  (helix)
  - A40 ↔ I44  (helix)
  - I42 ↔ F46  (helix)
  - A4 ↔ L10  (sheet)
  - F5 ↔ L10  (sheet)
  - Q41 ↔ Q47  (sheet)
  - Q41 ↔ N48  (sheet)
  - Q47 ↔ K52  (sheet)

## Solvent Accessibility (burial)

- buried=18 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=151 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=17 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9166 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

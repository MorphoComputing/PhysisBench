# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1NXB\seeds\seed_0\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 3.280 A
- tm_score_ca_ordered: 0.5733195260779079
- heavy_atom_rmsd: 4.600 A
- sidechain_heavy_atom_rmsd: 5.617 A
- **all-atom quality (honest):** heavy 4.600 A, sidechain 5.617 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 13
- distogram_pairs: 546
- bin_accuracy: 0.727

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_domain_topology_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.2794476181253436
- ga_delta_rmsd: 4.82522007436364  ga_fitness_mode: energy
- pre_local_rmsd: 3.292913836029705  localized_anchor_rmsd: 3.2795142697992055

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** G48-E55 → 10 conflicts (100%)
- explained: 10/10 conflicts by 1 root cause(s)
- metrics: hubs=7 (frac 0.117), conflicts/hub=1.4, max_incompat=4.88Å, chain_span=0.667
- **fix-first:** [LOW_CONFLICT] Root cause(s): G48-E55 — explain ~10/10 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K50** — severity 7.12, 3 conflict(s); suspect input ~`P18` (group: push_out)
  - push-out (wants farther): P18@26.1Å(now 19.6,conf 0.72), C54@14.2Å(now 11.1,conf 0.69)
  - C53↔P18: targets 10.9/26.1Å but partners are 10.3Å apart → too_close_together by 4.9Å
  - P43↔P18: targets 9.4/26.1Å but partners are 13.8Å apart → too_close_together by 2.9Å
  - E55↔P18: targets 17.0/26.1Å but partners are 6.9Å apart → too_close_together by 2.1Å
- **G48** — severity 2.94, 2 conflict(s); suspect input ~`L51` (group: push_out)
  - push-out (wants farther): C54@20.6Å(now 17.2,conf 0.79)
  - C54↔L51: targets 20.6/9.6Å but partners are 7.8Å apart → too_close_together by 3.2Å
  - C54↔S52: targets 20.6/13.3Å but partners are 5.0Å apart → too_close_together by 2.2Å
- **Q11** — severity 1.56, 1 conflict(s); suspect input ~`C54` (group: push_out)
  - push-out (wants farther): C54@17.7Å(now 14.7,conf 0.55)
  - N4↔C54: targets 7.0/17.7Å but partners are 7.9Å apart → too_close_together by 2.9Å
- **I49** — severity 1.03, 1 conflict(s); suspect input ~`S52` (group: push_out)
  - push-out (wants farther): C54@16.9Å(now 14.0,conf 0.91)
  - C54↔S52: targets 16.9/9.9Å but partners are 5.0Å apart → too_close_together by 1.9Å
- **L51** — severity 1.00, 1 conflict(s); suspect input ~`S17` (group: push_out)
  - push-out (wants farther): C54@10.7Å(now 7.8,conf 0.82), G19@20.8Å(now 17.3,conf 0.59), S17@20.3Å(now 15.3,conf 0.59), R32@19.4Å(now 16.6,conf 0.57), Q5@15.6Å(now 13.1,conf 0.55)
  - E55↔S17: targets 13.6/20.3Å but partners are 5.0Å apart → too_close_together by 1.7Å
- **T12** — severity 0.99, 1 conflict(s); suspect input ~`R38` (group: push_out)
  - push-out (wants farther): C54@17.4Å(now 12.6,conf 0.55)
  - C54↔R38: targets 17.4/9.4Å but partners are 6.2Å apart → too_close_together by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=32 · 3-10(G)=6 · coil(C)=7

```
CHEEECCHEGGEEEECECHEGEEEGEEEGEHEEECEGEEHEHHHHEHHEECEHHEEEHHE
```

## Backbone H-bond Network

- total=86 · helix(i→i+4)=4 · sheet=82
  - C40 ↔ T44  (helix)
  - P43 ↔ P47  (helix)
  - T44 ↔ G48  (helix)
  - C54 ↔ V58  (helix)
  - F3 ↔ Q9  (sheet)
  - F3 ↔ T12  (sheet)
  - F3 ↔ T13  (sheet)
  - F3 ↔ K14  (sheet)
  - F3 ↔ T15  (sheet)
  - F3 ↔ S17  (sheet)
  - F3 ↔ E20  (sheet)
  - F3 ↔ S22  (sheet)
  - F3 ↔ C23  (sheet)
  - N4 ↔ Q9  (sheet)
  - N4 ↔ T12  (sheet)
  - N4 ↔ T13  (sheet)
  - N4 ↔ K14  (sheet)
  - N4 ↔ T15  (sheet)
  - N4 ↔ C23  (sheet)
  - N4 ↔ Y24  (sheet)
  - … +66 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=275 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=198 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9561 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=13 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

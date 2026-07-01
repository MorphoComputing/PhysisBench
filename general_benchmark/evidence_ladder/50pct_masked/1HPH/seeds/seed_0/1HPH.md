# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1HPH\seeds\seed_0\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 1.991 A
- tm_score_ca_ordered: 0.5973619037089746
- heavy_atom_rmsd: 3.485 A
- sidechain_heavy_atom_rmsd: 4.243 A
- **all-atom quality (honest):** heavy 3.485 A, sidechain 4.243 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 264
- bin_accuracy: 0.788

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=33
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=3.6541326996764973 -> 3.273903452755597 A
- topology_reconvergence: applied=True accepted=36/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.9907146331926615
- ga_delta_rmsd: 0.39883943401496236  ga_fitness_mode: energy
- pre_local_rmsd: 1.990677234979395  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.057), conflicts/hub=1.0, max_incompat=4.02Å, chain_span=0.657
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V30** — severity 2.19, 1 conflict(s); suspect input ~`A35` (group: push_out)
  - push-out (wants farther): A35@11.8Å(now 6.5,conf 0.55)
  - F33↔A35: targets 6.1/11.8Å but partners are 1.7Å apart → too_close_together by 4.0Å
- **M7** — severity 1.10, 1 conflict(s); suspect input ~`S2` (group: push_out)
  - push-out (wants farther): S2@8.7Å(now 6.2,conf 0.55)
  - I4↔S2: targets 3.9/8.7Å but partners are 2.8Å apart → too_close_together by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=6 · 3-10(G)=7 · coil(C)=1

```
CEHHEHHHEHHHGGEHGHHGHGHHHHHHEHGHGHE
```

## Backbone H-bond Network

- total=13 · helix(i→i+4)=10 · sheet=3
  - I4 ↔ H8  (helix)
  - L6 ↔ L10  (helix)
  - H8 ↔ K12  (helix)
  - K12 ↔ S16  (helix)
  - R19 ↔ L23  (helix)
  - E21 ↔ K25  (helix)
  - L23 ↔ L27  (helix)
  - R24 ↔ Q28  (helix)
  - K26 ↔ V30  (helix)
  - V30 ↔ V34  (helix)
  - S2 ↔ N9  (sheet)
  - N9 ↔ N15  (sheet)
  - D29 ↔ A35  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=103 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=7 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7168 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
